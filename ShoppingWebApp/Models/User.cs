﻿using System;
using System.Collections.Generic;

namespace ShoppingWebApp.Models;

public partial class User:Common
{
    public int Id { get; set; }

    public string? FullName { get; set; }

    public string? Email { get; set; }

    public string? PhoneNo { get; set; }

    public string? Address { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }

}
