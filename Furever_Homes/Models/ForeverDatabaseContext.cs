using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Furever_Homes.Models;

public partial class ForeverDatabaseContext : DbContext
{
    public ForeverDatabaseContext()
    {
    }

    public ForeverDatabaseContext(DbContextOptions<ForeverDatabaseContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Adopter> Adopters { get; set; }

    public virtual DbSet<Adoption> Adoptions { get; set; }

    public virtual DbSet<AdoptionApplication> AdoptionApplications { get; set; }

    public virtual DbSet<Animal> Animals { get; set; }

    public virtual DbSet<AnimalPhoto> AnimalPhotos { get; set; }

    public virtual DbSet<AnimalType> AnimalTypes { get; set; }

    public virtual DbSet<Breed> Breeds { get; set; }

    public virtual DbSet<CatDetail> CatDetails { get; set; }

    public virtual DbSet<DogDetail> DogDetails { get; set; }

    public virtual DbSet<Shelter> Shelters { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)

        /*
         * Create a local secret.json file in the project root with the following content:
         connectionStrings": {
            "ForeverDatabase": "Your connection string here"
        }

        You can find your connection string when you connect to the database using ssms, just click on the Copy button in the connection dialog and paste it into the secret.json file. Make sure to replace "Your connection string here" with the actual connection string you copied.
         */

#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Name=ForeverDatabase");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Adopter>(entity =>
        {
            entity.HasKey(e => e.AdopterId).HasName("PK__Adopter__499FD2EDA3351B62");

            entity.ToTable("Adopter");

            entity.HasIndex(e => e.Email, "UQ_Adopter_Email").IsUnique();

            entity.Property(e => e.AdopterId).HasColumnName("AdopterID");
            entity.Property(e => e.AddressLine1)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.AddressLine2)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.City)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Country)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Email)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.FirstName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.LastName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.State)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ZipCode)
                .HasMaxLength(15)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Adoption>(entity =>
        {
            entity.HasKey(e => e.AdoptionId).HasName("PK__Adoption__38BABF0CAF26AEFB");

            entity.ToTable("Adoption");

            entity.HasIndex(e => e.ApplicationId, "UQ_Adoption_ApplicationID").IsUnique();

            entity.Property(e => e.AdoptionId).HasColumnName("AdoptionID");
            entity.Property(e => e.AdoptionDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.AdoptionFee).HasColumnType("decimal(8, 2)");
            entity.Property(e => e.ApplicationId).HasColumnName("ApplicationID");

            entity.HasOne(d => d.Application).WithOne(p => p.Adoption)
                .HasForeignKey<Adoption>(d => d.ApplicationId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Adoption_Application");
        });

        modelBuilder.Entity<AdoptionApplication>(entity =>
        {
            entity.HasKey(e => e.ApplicationId).HasName("PK__Adoption__C93A4F79F9B7E78D");

            entity.ToTable("AdoptionApplication");

            entity.HasIndex(e => new { e.AdopterId, e.AnimalId }, "UQ_AdoptionApplication_Adopter_Animal").IsUnique();

            entity.Property(e => e.ApplicationId).HasColumnName("ApplicationID");
            entity.Property(e => e.AdopterId).HasColumnName("AdopterID");
            entity.Property(e => e.AnimalId).HasColumnName("AnimalID");
            entity.Property(e => e.ApplicationDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Notes)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Status)
                .HasMaxLength(20)
                .IsUnicode(false);

            entity.HasOne(d => d.Adopter).WithMany(p => p.AdoptionApplications)
                .HasForeignKey(d => d.AdopterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AdoptionApplication_Adopter");

            entity.HasOne(d => d.Animal).WithMany(p => p.AdoptionApplications)
                .HasForeignKey(d => d.AnimalId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AdoptionApplication_Animal");
        });

        modelBuilder.Entity<Animal>(entity =>
        {
            entity.HasKey(e => e.AnimalId).HasName("PK__Animal__A21A7327A7C5B7ED");

            entity.ToTable("Animal");

            entity.Property(e => e.AnimalId).HasColumnName("AnimalID");
            entity.Property(e => e.AnimalTypeId).HasColumnName("AnimalTypeID");
            entity.Property(e => e.Available).HasDefaultValue(true);
            entity.Property(e => e.BreedId).HasColumnName("BreedID");
            entity.Property(e => e.Color)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Description)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Notes)
                .HasMaxLength(500)
                .IsUnicode(false);
            entity.Property(e => e.Sex)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.ShelterId).HasColumnName("ShelterID");
            entity.Property(e => e.Vaccinated).HasDefaultValue(true);
            entity.Property(e => e.Weight).HasColumnType("decimal(5, 2)");

            entity.HasOne(d => d.AnimalType).WithMany(p => p.Animals)
                .HasForeignKey(d => d.AnimalTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Animal_AnimalType");

            entity.HasOne(d => d.Breed).WithMany(p => p.Animals)
                .HasForeignKey(d => d.BreedId)
                .HasConstraintName("FK_Animal_Breed");

            entity.HasOne(d => d.Shelter).WithMany(p => p.Animals)
                .HasForeignKey(d => d.ShelterId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Animal_Shelter");
        });

        modelBuilder.Entity<AnimalPhoto>(entity =>
        {
            entity.HasKey(e => e.PhotoId).HasName("PK__AnimalPh__21B7B5826DBD07F1");

            entity.ToTable("AnimalPhoto");

            entity.HasIndex(e => e.AnimalId, "UQ_AnimalPhoto_PrimaryPhoto")
                .IsUnique()
                .HasFilter("([IsPrimary]=(1))");

            entity.Property(e => e.PhotoId).HasColumnName("PhotoID");
            entity.Property(e => e.AnimalId).HasColumnName("AnimalID");
            entity.Property(e => e.Caption)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.PhotoUrl)
                .HasMaxLength(255)
                .IsUnicode(false);

            entity.HasOne(d => d.Animal).WithOne(p => p.AnimalPhoto)
                .HasForeignKey<AnimalPhoto>(d => d.AnimalId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_AnimalPhoto_Animal");
        });

        modelBuilder.Entity<AnimalType>(entity =>
        {
            entity.HasKey(e => e.AnimalTypeId).HasName("PK__AnimalTy__1E8A4896CBCCC0D9");

            entity.ToTable("AnimalType");

            entity.HasIndex(e => e.TypeName, "UQ__AnimalTy__D4E7DFA89BCEDE89").IsUnique();

            entity.Property(e => e.AnimalTypeId).HasColumnName("AnimalTypeID");
            entity.Property(e => e.TypeName)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Breed>(entity =>
        {
            entity.HasKey(e => e.BreedId).HasName("PK__Breed__D1E9AEBD9503063E");

            entity.ToTable("Breed");

            entity.HasIndex(e => new { e.BreedName, e.AnimalTypeId }, "UQ_Breed_BreedName_AnimalType").IsUnique();

            entity.Property(e => e.BreedId).HasColumnName("BreedID");
            entity.Property(e => e.AnimalTypeId).HasColumnName("AnimalTypeID");
            entity.Property(e => e.BreedName)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.AnimalType).WithMany(p => p.Breeds)
                .HasForeignKey(d => d.AnimalTypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Breed_AnimalType");
        });

        modelBuilder.Entity<CatDetail>(entity =>
        {
            entity.HasKey(e => e.AnimalId).HasName("PK__CatDetai__A21A7327507AA80D");

            entity.ToTable("CatDetail");

            entity.Property(e => e.AnimalId)
                .ValueGeneratedNever()
                .HasColumnName("AnimalID");
            entity.Property(e => e.CatCoat)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Fivpositive).HasColumnName("FIVPositive");

            entity.HasOne(d => d.Animal).WithOne(p => p.CatDetail)
                .HasForeignKey<CatDetail>(d => d.AnimalId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_CatDetail_Animal");
        });

        modelBuilder.Entity<DogDetail>(entity =>
        {
            entity.HasKey(e => e.AnimalId).HasName("PK__DogDetai__A21A732771C402AF");

            entity.ToTable("DogDetail");

            entity.Property(e => e.AnimalId)
                .ValueGeneratedNever()
                .HasColumnName("AnimalID");
            entity.Property(e => e.DogCoat)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Animal).WithOne(p => p.DogDetail)
                .HasForeignKey<DogDetail>(d => d.AnimalId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_DogDetail_Animal");
        });

        modelBuilder.Entity<Shelter>(entity =>
        {
            entity.HasKey(e => e.ShelterId).HasName("PK__Shelter__E2CDF5743FBCF783");

            entity.ToTable("Shelter");

            entity.Property(e => e.ShelterId).HasColumnName("ShelterID");
            entity.Property(e => e.AddressLine1)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.AddressLine2)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.City)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ContactEmail)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Country)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.PhoneNumber)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.ShelterName)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.State)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.ZipCode)
                .HasMaxLength(15)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
