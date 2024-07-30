using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using ShoppingWebApp.Helpers;
using ShoppingWebApp.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Web;
using TREKTRACKRWebAPP.Models;

namespace ShoppingWebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class AccountController : ControllerBase
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly IConfiguration _config;

        // Constructor
        public AccountController(UserManager<IdentityUser> userManager,
            SignInManager<IdentityUser> signInManager, IConfiguration config)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _config = config;
        }
        [HttpPost("Register")]
        public async Task<APIResponse> SignUp(RegisterDTO registerDTO)
        {
            try
            {
                var exist = await _userManager.FindByEmailAsync(registerDTO.Email);
                if (exist != null)
                {
                    return APIResponseBuilder.getResponseObject(registerDTO, "Email Is already Registered", true);
                }
                var user = new IdentityUser
                {
                    Id = Guid.NewGuid().ToString(),
                    UserName = registerDTO.Email,
                    Email = registerDTO.Email,
                    EmailConfirmed = false
                };
                var result = await _userManager.CreateAsync(user, registerDTO.Password);
                if (!result.Succeeded)
                {
                    return APIResponseBuilder.getResponseObject(registerDTO, "Error While Register User.", true);
                }
                return APIResponseBuilder.getResponseObject(registerDTO, "User Registered Successfully.", true);
            }
            catch (Exception ex)
            {
                return APIResponseBuilder.getResponseObject(registerDTO,ex.Message, false);
            }
            
        }
        [HttpPost("Login")]
        [AllowAnonymous]
        public async Task<APIResponse> SignIn(LoginDTO loginDTO)
        {
            try
            {
                var signInResult = await _signInManager.PasswordSignInAsync(loginDTO.Email, loginDTO.Password, false, false);

                if (signInResult.Succeeded)
                {
                    var user = await _userManager.FindByEmailAsync(loginDTO.Email);
                    var token = GenerateJSONWebToken(user);
                    return APIResponseBuilder.getResponseObject(token, "User Login Successfully.", true);
                }
                return APIResponseBuilder.getResponseObject(loginDTO, "Error While Login User.", true);
            }
            catch (Exception ex)
            {
                return APIResponseBuilder.getResponseObject(loginDTO, ex.Message, false);
            }
         
        }
        [HttpGet("UserList")]
        public async Task<APIResponse> UserList()
        {
            var usersList = new List<IdentityUser>();
            try
            {
                usersList = await _userManager.Users.ToListAsync();

                if (usersList != null)
                {
                    return APIResponseBuilder.getResponseObject(usersList, "User List Fetched Successfully.", true);
                }
                return APIResponseBuilder.getResponseObject(usersList, "User List", true);
            }
            catch(Exception ex)
            {
                return APIResponseBuilder.getResponseObject(usersList, ex.Message, false);
            }
          
        }
        private string GenerateJSONWebToken(IdentityUser userInfo)
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
