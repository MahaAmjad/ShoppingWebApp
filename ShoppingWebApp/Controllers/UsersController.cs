using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client.Platforms.Features.DesktopOs.Kerberos;
using Microsoft.IdentityModel.Tokens;
using ShoppingWebApp.Helpers;
using ShoppingWebApp.Models;
using TREKTRACKRWebAPP.Models;

namespace ShoppingWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UsersController : ControllerBase
    {
        private readonly ShoppingDbContext _context;
        private readonly IConfiguration _config;

        public UsersController(ShoppingDbContext context, IConfiguration config)
        {
            _context = context;
            _config = config;
        }

        [HttpGet]
        public async Task<ActionResult<APIResponse>> GetUsers()
        {
            IList<User>? usersList = new List<User>();
            try
            {
               usersList=_context.Users.ToList();
                return APIResponseBuilder.getResponseObject(usersList,"Users List Fetched Successfully.",true);
            }
            catch(Exception ex)
            {
                return  APIResponseBuilder.getResponseObject(usersList, ex.Message, false);
            }
 
        }

        // POST: api/Users
        [HttpPost]
        public async Task<ActionResult<APIResponse>> PostUser(User user)
        {
            try
            {
                _context.Users.Add(user);
                await _context.SaveChangesAsync();
                return APIResponseBuilder.getResponseObject(user, "Users added Successfully.", true);
            }
            catch (Exception ex) {
                return APIResponseBuilder.getResponseObject(user, ex.Message, false);
            }
          
        }
        [HttpPost("Login")]
        [AllowAnonymous]
        public async Task<ActionResult<APIResponse>> Login(string Username, string password)
        {
            try
            {

                var user = AuthenticateUser(Username, password);

                if (user != null)
                {
                    var tokenString = GenerateJSONWebToken(user);
                    return APIResponseBuilder.getResponseObject(tokenString, "User Login Successfully", true);
                }

                return APIResponseBuilder.getResponseObject("", "Invalid Credentials", true);
            }
            catch(Exception ex)
            {
                return APIResponseBuilder.getResponseObject("", ex.Message, false);
            }
        }
        private User AuthenticateUser(string username, string password)
        {
            User? user = _context.Users.Where(m => m.Username == username && m.Password == password && m.Status == Helpers.Constants.Status.Active).FirstOrDefault();

            return user;
        }
        private string GenerateJSONWebToken(User userInfo)
        {

            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("This is Secret key for shopping app"));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var claims = new[]
            {
                new Claim(ClaimTypes.NameIdentifier, userInfo.Email)
            };
            var token = new JwtSecurityToken(
                _config["Jwt:Issuer"],
                _config["Jwt:Audience"],
                claims,
                expires: DateTime.Now.AddMinutes(120),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    
    }
}
