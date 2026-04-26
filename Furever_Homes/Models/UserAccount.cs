using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class UserAccount
{
    public string UserName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string? Address { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string? PhoneNumber { get; set; }

    public string? Password { get; set; }
}
