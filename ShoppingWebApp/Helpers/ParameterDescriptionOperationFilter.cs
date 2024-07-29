using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace ShoppingWebApp.Helpers
{
    public class ParameterDescriptionOperationFilter : IOperationFilter
    {
        public void Apply(OpenApiOperation operation, OperationFilterContext context)
        {
            foreach (var parameter in operation.Parameters)
            {
                if (parameter.Name == "permission")
                {
                    parameter.Description = "Select 0 for Read Permission, 1 for Write Permission";
                }
            }
        }
    }
}
