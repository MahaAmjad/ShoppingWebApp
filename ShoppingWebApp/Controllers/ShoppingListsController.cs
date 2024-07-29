using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json.Converters;
using ShoppingWebApp.Helpers;
using ShoppingWebApp.Models;
using TREKTRACKRWebAPP.Models;

namespace ShoppingWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class ShoppingListsController : ControllerBase
    {
        private readonly ShoppingDbContext _context;

        public ShoppingListsController(ShoppingDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<APIResponse>> GetShoppingLists()
        {
            IList<ShoppingList>? shoppingList = new List<ShoppingList>();
            try
            {
                shoppingList = _context.ShoppingLists
                            .Include(m=>m.Items).ToList();
                return APIResponseBuilder.getResponseObject(shoppingList, "Shopping List Fetched Successfully.", true);
            }
            catch (Exception ex)
            {
                return APIResponseBuilder.getResponseObject(shoppingList, ex.Message, false);
            }
        }

        [HttpPost]
        public async Task<ActionResult<APIResponse>> PostShoppingList(ShoppingList shoppingList)
        {
            using (var transaction = _context.Database.BeginTransaction())
            {
                try
                {
                    _context.ShoppingLists.Add(shoppingList);
                    await _context.SaveChangesAsync();
                    foreach (var item in shoppingList.Items)
                    {
                        item.ShoppingListId = shoppingList.Id;
                        item.Id = 0;
                        _context.ShoppingListItems.Add(item);
                    }
                    await _context.SaveChangesAsync();
                    transaction.Commit();
                    return APIResponseBuilder.getResponseObject(shoppingList, "Shopping List added Successfully", true);
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    return APIResponseBuilder.getResponseObject(shoppingList, ex.Message, false);
                }
            }
            
        }
        [HttpPost("share")]
        public ActionResult<APIResponse> ShareShoppingList([FromQuery, Required] int listId,PermissionOptions? permission, string sharedWith = "")
        {
            try
            {
                var getUserWithEmail = _context.Users.Where(m => m.Email == sharedWith).FirstOrDefault();
                if (getUserWithEmail != null)
                {
                    var sharedListObj = new SharedList
                    {
                        SharedListWithId = getUserWithEmail.Id,
                        Permission = permission.ToString(),
                        ShoppingListId = listId,
                        CreatedBy = "Admin",
                        CreatedDate = DateTime.Now,
                        Status = Helpers.Constants.Status.Active
                    };
                    _context.SharedLists.Add(sharedListObj);
                    _context.SaveChanges();
                    return APIResponseBuilder.getResponseObject(sharedListObj, "Shopping List shared successfully with " + sharedWith, true);
                }
                return APIResponseBuilder.getResponseObject("", "No User Exist with this Email " + sharedWith, true);

            }
            catch (Exception ex)
            {
                return APIResponseBuilder.getResponseObject("", "Error! While sharing list with " + sharedWith, true);

            }
        }
        [HttpGet("shared")]
        public ActionResult<APIResponse> SharedShoppingList([FromQuery, Required] int userId)
        {
            IList<ShoppingList>? sharedList = new List<ShoppingList>();
            try
            {
                var sharedShoppingListId=_context.SharedLists.Where(m=>m.SharedListWithId== userId).Select(m=>m.ShoppingListId).ToList();
                sharedList = _context.ShoppingLists.Where(m => sharedShoppingListId.Contains(m.Id))
                    .Include(m => m.Items).ToList();
                return APIResponseBuilder.getResponseObject(sharedList, "Shared Shopping List Fetched Successfully.", true);
            }
            catch (Exception ex)
            {
                return APIResponseBuilder.getResponseObject(sharedList, ex.Message, false);
            }
        }
        public enum PermissionOptions
        {
            Read,
            Write
        }
    }

}
