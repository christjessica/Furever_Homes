-- FurEver Homes Database
-- Run in SQL Server Management Studio
-- Includes schema and constraints for pet adoption system

/****** Object:  Database [ForeverDatabase]    Script Date: 5/4/2026 11:02:49 PM ******/
CREATE DATABASE [ForeverDatabase]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_S_Gen5_1', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [ForeverDatabase] SET COMPATIBILITY_LEVEL = 170
GO
ALTER DATABASE [ForeverDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ForeverDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ForeverDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ForeverDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ForeverDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [ForeverDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ForeverDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ForeverDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ForeverDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ForeverDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ForeverDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ForeverDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ForeverDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ForeverDatabase] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [ForeverDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ForeverDatabase] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ForeverDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [ForeverDatabase] SET ENCRYPTION ON
GO
ALTER DATABASE [ForeverDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [ForeverDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/4/2026 11:02:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adopter]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adopter](
	[AdopterID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
	[AddressLine1] [varchar](100) NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[ZipCode] [varchar](15) NULL,
	[Country] [varchar](100) NULL,
	[ApplicationUserId] [nvarchar](450) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdopterID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Adopter_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adoption]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adoption](
	[AdoptionID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationID] [int] NOT NULL,
	[AdoptionDate] [datetime] NOT NULL,
	[AdoptionFee] [decimal](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdoptionID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Adoption_ApplicationID] UNIQUE NONCLUSTERED 
(
	[ApplicationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdoptionApplication]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdoptionApplication](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[AdopterID] [int] NOT NULL,
	[AnimalID] [int] NOT NULL,
	[ApplicationDate] [datetime] NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[Notes] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_AdoptionApplication_Adopter_Animal] UNIQUE NONCLUSTERED 
(
	[AdopterID] ASC,
	[AnimalID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[AnimalID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[AnimalTypeID] [int] NOT NULL,
	[BreedID] [int] NOT NULL,
	[Age] [int] NULL,
	[Weight] [decimal](5, 2) NULL,
	[Sex] [varchar](20) NULL,
	[Color] [varchar](50) NULL,
	[SpayedNeutered] [bit] NULL,
	[Notes] [varchar](500) NULL,
	[Available] [bit] NOT NULL,
	[ShelterID] [int] NOT NULL,
	[Vaccinated] [bit] NOT NULL,
	[Description] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalPhoto]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalPhoto](
	[PhotoID] [int] IDENTITY(1,1) NOT NULL,
	[AnimalID] [int] NOT NULL,
	[PhotoUrl] [varchar](1000) NOT NULL,
	[Caption] [varchar](100) NULL,
	[IsPrimary] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalType]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalType](
	[AnimalTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AnimalTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserType] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Breed]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Breed](
	[BreedID] [int] IDENTITY(1,1) NOT NULL,
	[BreedName] [varchar](100) NOT NULL,
	[AnimalTypeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BreedID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Breed_BreedName_AnimalType] UNIQUE NONCLUSTERED 
(
	[BreedName] ASC,
	[AnimalTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CatDetail]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatDetail](
	[AnimalID] [int] NOT NULL,
	[FIVPositive] [bit] NULL,
	[LitterTrained] [bit] NULL,
	[Declawed] [bit] NULL,
	[CatCoat] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DogDetail]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DogDetail](
	[AnimalID] [int] NOT NULL,
	[HouseTrained] [bit] NULL,
	[Heartworm] [bit] NULL,
	[DogCoat] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SavedAnimal]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SavedAnimal](
	[SavedAnimalId] [int] IDENTITY(1,1) NOT NULL,
	[AdopterId] [int] NOT NULL,
	[AnimalId] [int] NOT NULL,
 CONSTRAINT [PK_SavedAnimal] PRIMARY KEY CLUSTERED 
(
	[SavedAnimalId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shelter]    Script Date: 5/4/2026 11:02:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shelter](
	[ShelterID] [int] IDENTITY(1,1) NOT NULL,
	[ShelterName] [varchar](100) NOT NULL,
	[AddressLine1] [varchar](100) NOT NULL,
	[AddressLine2] [varchar](100) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[ZipCode] [varchar](15) NOT NULL,
	[Country] [varchar](100) NOT NULL,
	[ContactEmail] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[ApplicationUserId] [nvarchar](450) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShelterID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Adopter_ApplicationUserId]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Adopter_ApplicationUserId] ON [dbo].[Adopter]
(
	[ApplicationUserId] ASC
)
WHERE ([ApplicationUserId] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Animal_BreedID]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_Animal_BreedID] ON [dbo].[Animal]
(
	[BreedID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_AnimalPhoto_PrimaryPhoto]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_AnimalPhoto_PrimaryPhoto] ON [dbo].[AnimalPhoto]
(
	[AnimalID] ASC
)
WHERE ([IsPrimary]=(1))
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SavedAnimal_AdopterId_AnimalId]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SavedAnimal_AdopterId_AnimalId] ON [dbo].[SavedAnimal]
(
	[AdopterId] ASC,
	[AnimalId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SavedAnimal_AnimalId]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE NONCLUSTERED INDEX [IX_SavedAnimal_AnimalId] ON [dbo].[SavedAnimal]
(
	[AnimalId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_SavedAnimal_Adopter_Animal]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_SavedAnimal_Adopter_Animal] ON [dbo].[SavedAnimal]
(
	[AdopterId] ASC,
	[AnimalId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Shelter_ApplicationUserId]    Script Date: 5/4/2026 11:02:50 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Shelter_ApplicationUserId] ON [dbo].[Shelter]
(
	[ApplicationUserId] ASC
)
WHERE ([ApplicationUserId] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adoption] ADD  DEFAULT (getdate()) FOR [AdoptionDate]
GO
ALTER TABLE [dbo].[AdoptionApplication] ADD  DEFAULT (getdate()) FOR [ApplicationDate]
GO
ALTER TABLE [dbo].[Animal] ADD  CONSTRAINT [DF_Animal_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[Animal] ADD  CONSTRAINT [DF_Animal_Vaccinated]  DEFAULT ((1)) FOR [Vaccinated]
GO
ALTER TABLE [dbo].[AnimalPhoto] ADD  DEFAULT ((0)) FOR [IsPrimary]
GO
ALTER TABLE [dbo].[Adopter]  WITH CHECK ADD  CONSTRAINT [FK_Adopter_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Adopter] CHECK CONSTRAINT [FK_Adopter_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[Adoption]  WITH CHECK ADD  CONSTRAINT [FK_Adoption_Application] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[AdoptionApplication] ([ApplicationID])
GO
ALTER TABLE [dbo].[Adoption] CHECK CONSTRAINT [FK_Adoption_Application]
GO
ALTER TABLE [dbo].[AdoptionApplication]  WITH CHECK ADD  CONSTRAINT [FK_AdoptionApplication_Adopter] FOREIGN KEY([AdopterID])
REFERENCES [dbo].[Adopter] ([AdopterID])
GO
ALTER TABLE [dbo].[AdoptionApplication] CHECK CONSTRAINT [FK_AdoptionApplication_Adopter]
GO
ALTER TABLE [dbo].[AdoptionApplication]  WITH CHECK ADD  CONSTRAINT [FK_AdoptionApplication_Animal] FOREIGN KEY([AnimalID])
REFERENCES [dbo].[Animal] ([AnimalID])
GO
ALTER TABLE [dbo].[AdoptionApplication] CHECK CONSTRAINT [FK_AdoptionApplication_Animal]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_AnimalType] FOREIGN KEY([AnimalTypeID])
REFERENCES [dbo].[AnimalType] ([AnimalTypeID])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_AnimalType]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Breed] FOREIGN KEY([BreedID])
REFERENCES [dbo].[Breed] ([BreedID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Breed]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Shelter] FOREIGN KEY([ShelterID])
REFERENCES [dbo].[Shelter] ([ShelterID])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Shelter]
GO
ALTER TABLE [dbo].[AnimalPhoto]  WITH CHECK ADD  CONSTRAINT [FK_AnimalPhoto_Animal] FOREIGN KEY([AnimalID])
REFERENCES [dbo].[Animal] ([AnimalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnimalPhoto] CHECK CONSTRAINT [FK_AnimalPhoto_Animal]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Breed]  WITH CHECK ADD  CONSTRAINT [FK_Breed_AnimalType] FOREIGN KEY([AnimalTypeID])
REFERENCES [dbo].[AnimalType] ([AnimalTypeID])
GO
ALTER TABLE [dbo].[Breed] CHECK CONSTRAINT [FK_Breed_AnimalType]
GO
ALTER TABLE [dbo].[CatDetail]  WITH CHECK ADD  CONSTRAINT [FK_CatDetail_Animal] FOREIGN KEY([AnimalID])
REFERENCES [dbo].[Animal] ([AnimalID])
GO
ALTER TABLE [dbo].[CatDetail] CHECK CONSTRAINT [FK_CatDetail_Animal]
GO
ALTER TABLE [dbo].[DogDetail]  WITH CHECK ADD  CONSTRAINT [FK_DogDetail_Animal] FOREIGN KEY([AnimalID])
REFERENCES [dbo].[Animal] ([AnimalID])
GO
ALTER TABLE [dbo].[DogDetail] CHECK CONSTRAINT [FK_DogDetail_Animal]
GO
ALTER TABLE [dbo].[SavedAnimal]  WITH CHECK ADD  CONSTRAINT [FK_SavedAnimal_Adopter_AdopterId] FOREIGN KEY([AdopterId])
REFERENCES [dbo].[Adopter] ([AdopterID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SavedAnimal] CHECK CONSTRAINT [FK_SavedAnimal_Adopter_AdopterId]
GO
ALTER TABLE [dbo].[SavedAnimal]  WITH CHECK ADD  CONSTRAINT [FK_SavedAnimal_Animal_AnimalId] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[Animal] ([AnimalID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SavedAnimal] CHECK CONSTRAINT [FK_SavedAnimal_Animal_AnimalId]
GO
ALTER TABLE [dbo].[Shelter]  WITH CHECK ADD  CONSTRAINT [FK_Shelter_AspNetUsers_ApplicationUserId] FOREIGN KEY([ApplicationUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Shelter] CHECK CONSTRAINT [FK_Shelter_AspNetUsers_ApplicationUserId]
GO
ALTER TABLE [dbo].[AdoptionApplication]  WITH CHECK ADD  CONSTRAINT [CK_AdoptionApplication_Status] CHECK  (([Status]='Withdrawn' OR [Status]='Denied' OR [Status]='Accepted' OR [Status]='Under Review' OR [Status]='Pending' OR [Status]='Submitted'))
GO
ALTER TABLE [dbo].[AdoptionApplication] CHECK CONSTRAINT [CK_AdoptionApplication_Status]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [CK_Animal_Sex] CHECK  (([Sex]='Unknown' OR [Sex]='Female' OR [Sex]='Male'))
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [CK_Animal_Sex]
GO
ALTER TABLE [dbo].[CatDetail]  WITH CHECK ADD  CONSTRAINT [CK_CatDetail_CatCoat] CHECK  (([CatCoat]='Hairless' OR [CatCoat]='Long Hair' OR [CatCoat]='Medium Hair' OR [CatCoat]='Short Hair'))
GO
ALTER TABLE [dbo].[CatDetail] CHECK CONSTRAINT [CK_CatDetail_CatCoat]
GO
ALTER TABLE [dbo].[DogDetail]  WITH CHECK ADD  CONSTRAINT [CK_DogDetail_DogCoat] CHECK  (([DogCoat]='Double' OR [DogCoat]='Hairless' OR [DogCoat]='Curly' OR [DogCoat]='Wire' OR [DogCoat]='Long' OR [DogCoat]='Medium' OR [DogCoat]='Short'))
GO
ALTER TABLE [dbo].[DogDetail] CHECK CONSTRAINT [CK_DogDetail_DogCoat]
GO
ALTER DATABASE [ForeverDatabase] SET  READ_WRITE 
GO
