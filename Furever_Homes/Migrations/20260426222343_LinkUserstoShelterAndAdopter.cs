using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Furever_Homes.Migrations
{
    /// <inheritdoc />
    public partial class LinkUserstoShelterAndAdopter : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ApplicationUserId",
                table: "Shelter",
                type: "nvarchar(450)",
                maxLength: 450,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "ApplicationUserId",
                table: "Adopter",
                type: "nvarchar(450)",
                maxLength: 450,
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Shelter_ApplicationUserId",
                table: "Shelter",
                column: "ApplicationUserId",
                unique: true,
                filter: "[ApplicationUserId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_Adopter_ApplicationUserId",
                table: "Adopter",
                column: "ApplicationUserId",
                unique: true,
                filter: "[ApplicationUserId] IS NOT NULL");

            migrationBuilder.AddForeignKey(
                name: "FK_Adopter_AspNetUsers_ApplicationUserId",
                table: "Adopter",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Shelter_AspNetUsers_ApplicationUserId",
                table: "Shelter",
                column: "ApplicationUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Adopter_AspNetUsers_ApplicationUserId",
                table: "Adopter");

            migrationBuilder.DropForeignKey(
                name: "FK_Shelter_AspNetUsers_ApplicationUserId",
                table: "Shelter");

            migrationBuilder.DropIndex(
                name: "IX_Shelter_ApplicationUserId",
                table: "Shelter");

            migrationBuilder.DropIndex(
                name: "IX_Adopter_ApplicationUserId",
                table: "Adopter");

            migrationBuilder.DropColumn(
                name: "ApplicationUserId",
                table: "Shelter");

            migrationBuilder.DropColumn(
                name: "ApplicationUserId",
                table: "Adopter");
        }
    }
}
