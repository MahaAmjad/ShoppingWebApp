using TREKTRACKRWebAPP.Models;

namespace ShoppingWebApp.Helpers
{
    public class APIResponseBuilder
    {
        public static APIResponse getResponseObject(dynamic result, string message, bool status)
        {
            var aPIResponse = new APIResponse();
            aPIResponse.Status = status;
            aPIResponse.Message = message;
            aPIResponse.Result = result;

            return aPIResponse;
        }
    }
}
