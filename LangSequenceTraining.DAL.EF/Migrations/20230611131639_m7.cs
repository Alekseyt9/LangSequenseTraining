using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LangSequenceTraining.Migrations
{
    /// <inheritdoc />
    public partial class m7 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserSequenceProgress_Sequences_SequenseId",
                table: "UserSequenceProgress");

            migrationBuilder.RenameColumn(
                name: "SequenseId",
                table: "UserSequenceProgress",
                newName: "SequenceId");

            migrationBuilder.RenameIndex(
                name: "IX_UserSequenceProgress_SequenseId",
                table: "UserSequenceProgress",
                newName: "IX_UserSequenceProgress_SequenceId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserSequenceProgress_Sequences_SequenceId",
                table: "UserSequenceProgress",
                column: "SequenceId",
                principalTable: "Sequences",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserSequenceProgress_Sequences_SequenceId",
                table: "UserSequenceProgress");

            migrationBuilder.RenameColumn(
                name: "SequenceId",
                table: "UserSequenceProgress",
                newName: "SequenseId");

            migrationBuilder.RenameIndex(
                name: "IX_UserSequenceProgress_SequenceId",
                table: "UserSequenceProgress",
                newName: "IX_UserSequenceProgress_SequenseId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserSequenceProgress_Sequences_SequenseId",
                table: "UserSequenceProgress",
                column: "SequenseId",
                principalTable: "Sequences",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
