using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class Adopter
{
    public int AdopterId { get; set; }

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string? PhoneNumber { get; set; }

    public string? AddressLine1 { get; set; }

    public string? AddressLine2 { get; set; }

    public string? City { get; set; }

    public string? State { get; set; }

    public string? ZipCode { get; set; }

    public string? Country { get; set; }

    public virtual ICollection<AdoptionApplication> AdoptionApplications { get; set; } = new List<AdoptionApplication>();
}
