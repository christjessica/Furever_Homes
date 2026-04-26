using System;
using System.Collections.Generic;

namespace Furever_Homes.Models;

public partial class AdoptionApplication
{
    public int ApplicationId { get; set; }

    public int AdopterId { get; set; }

    public int AnimalId { get; set; }

    public DateTime ApplicationDate { get; set; }

    public string Status { get; set; } = null!;

    public string? Notes { get; set; }

    public virtual Adopter Adopter { get; set; } = null!;

    public virtual Adoption? Adoption { get; set; }

    public virtual Animal Animal { get; set; } = null!;
}
