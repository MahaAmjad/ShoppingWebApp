using System;
using System.Collections.Generic;

namespace ShoppingWebApp.Models;

public partial class SharedList:Common
{
    public int Id { get; set; }

    public int? SharedListWithId { get; set; }

    public int? ShoppingListId { get; set; }

    public string? Permission { get; set; }
    public ShoppingList? ShoppingList { get; set; }
 
}
