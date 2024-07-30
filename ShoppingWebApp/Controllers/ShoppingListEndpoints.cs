using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.OpenApi;
using ShoppingWebApp.Models;
using ShoppingWebApp.Helpers;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
namespace ShoppingWebApp.Controllers;

[Authorize]
public static class ShoppingListEndpoints
{
    public static void MapShoppingListEndpoints (this IEndpointRouteBuilder routes)
    {
        var group = routes.MapGroup("/api/ShoppingList").WithTags(nameof(ShoppingList));

        group.MapGet("/", async (ShoppingDbContext db) =>
        {
            IList<ShoppingList>? shoppingList = new List<ShoppingList>();
            try
            {
                shoppingList = db.ShoppingLists
                            .Include(m => m.Items).ToList();
                return APIResponseBuilder.getResponseObject(shoppingList, "Shopping List Fetched Successfully.", true);
            }
            catch (Exception ex)
            {
                return APIResponseBuilder.getResponseObject(shoppingList, ex.Message, false);
            }
        })
        .WithName("GetAllShoppingLists")
        .RequireAuthorization()
        .WithOpenApi();


        group.MapPost("/", async (ShoppingList shoppingList, ShoppingDbContext db) =>
        {
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    db.ShoppingLists.Add(shoppingList);
                    await db.SaveChangesAsync();
                    foreach (var item in shoppingList.Items)
                    {
                        item.ShoppingListId = shoppingList.Id;
                        item.Id = 0;
                        db.ShoppingListItems.Add(item);
                    }
                    await db.SaveChangesAsync();
                    transaction.Commit();
                    return APIResponseBuilder.getResponseObject(shoppingList, "Shopping List added Successfully", true);
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    return APIResponseBuilder.getResponseObject(shoppingList, ex.Message, false);
                }
            }
        })
        .WithName("CreateShoppingList")
        .WithOpenApi();
        group.MapPost("/share", async ([FromQuery, Required] int listId, PermissionOptions? permission, ShoppingDbContext db, UserManager<IdentityUser> _userManager, string sharedWith = "") =>
        {
            try
            {
                var getUserWithEmail =_userManager.FindByEmailAsync(sharedWith);
                if (getUserWithEmail != null)
                {
                    var sharedListObj = new SharedList
                    {
                        SharedListWithId = getUserWithEmail.Result.Id,
                        Permission = permission.ToString(),
                        ShoppingListId = listId,
                        CreatedBy = "Admin",
                        CreatedDate = DateTime.Now,
                        Status = Helpers.Constants.Status.Active
                    };
                    db.SharedLists.Add(sharedListObj);
                    db.SaveChanges();
                    return APIResponseBuilder.getResponseObject(sharedListObj, "Shopping List shared successfully with " + sharedWith, true);
                }
                return APIResponseBuilder.getResponseObject("", "No User Exist with this Email " + sharedWith, true);

            }
            catch (Exception ex)
            {
                return APIResponseBuilder.getResponseObject("", "Error! While sharing list with " + sharedWith, true);

            }
        })
        .WithName("ShareShoppingList")
        .WithOpenApi();
        group.MapGet("/shared", async ([FromQuery, Required] string userId,ShoppingDbContext db) =>
        {
            IList<ShoppingList>? sharedList = new List<ShoppingList>();
            try
            {
                var sharedShoppingListId = db.SharedLists.Where(m => m.SharedListWithId == userId).Select(m => m.ShoppingListId).ToList();
                sharedList = db.ShoppingLists.Where(m => sharedShoppingListId.Contains(m.Id))
                    .Include(m => m.Items).ToList();
                return APIResponseBuilder.getResponseObject(sharedList, "Shared Shopping List Fetched Successfully.", true);
            }
            catch (Exception ex)
            {
                return APIResponseBuilder.getResponseObject(sharedList, ex.Message, false);
            }
        })
       .WithName("SharedShoppingLists")
       .WithOpenApi();
    }
    public enum PermissionOptions
    {
        Read,
        Write
    }
}
