using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class Shelter
{
    public int ShelterId { get; set; }

    public string ShelterName { get; set; } = null!;

    public string AddressLine1 { get; set; } = null!;

    public string? AddressLine2 { get; set; }

    public string City { get; set; } = null!;

    public string State { get; set; } = null!;

    public string ZipCode { get; set; } = null!;

    public string Country { get; set; } = null!;

    public string ContactEmail { get; set; } = null!;

    public string PhoneNumber { get; set; } = null!;

    public virtual ICollection<Animal> Animals { get; set; } = new List<Animal>();
}
