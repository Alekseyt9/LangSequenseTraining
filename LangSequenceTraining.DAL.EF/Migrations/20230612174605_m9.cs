using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LangSequenceTraining.Migrations
{
    /// <inheritdoc />
    public partial class m9 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_UserState_UserId",
                table: "UserState");

            migrationBuilder.CreateIndex(
                name: "IX_UserState_UserId",
                table: "UserState",
                column: "UserId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Users_Name",
                table: "Users",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_SequenceGroup_Name",
                table: "SequenceGroup",
                column: "Name",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_UserState_UserId",
                table: "UserState");

            migrationBuilder.DropIndex(
                name: "IX_Users_Name",
                table: "Users");

            migrationBuilder.DropIndex(
                name: "IX_SequenceGroup_Name",
                table: "SequenceGroup");

            migrationBuilder.CreateIndex(
                name: "IX_UserState_UserId",
                table: "UserState",
                column: "UserId");
        }
    }
}
