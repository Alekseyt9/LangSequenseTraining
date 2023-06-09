using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace LangSequenceTraining.Migrations
{
    /// <inheritdoc />
    public partial class m2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserSequenceProgress_Sequence_SequenseId",
                table: "UserSequenceProgress");

            migrationBuilder.DropForeignKey(
                name: "FK_UserSequenceProgress_User_UserId",
                table: "UserSequenceProgress");

            migrationBuilder.DropPrimaryKey(
                name: "PK_User",
                table: "User");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Sequence",
                table: "Sequence");

            migrationBuilder.RenameTable(
                name: "User",
                newName: "Users");

            migrationBuilder.RenameTable(
                name: "Sequence",
                newName: "Sequences");

            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "SequenceGroups",
                type: "text",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Users",
                table: "Users",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Sequences",
                table: "Sequences",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserSequenceProgress_Sequences_SequenseId",
                table: "UserSequenceProgress",
                column: "SequenseId",
                principalTable: "Sequences",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_UserSequenceProgress_Users_UserId",
                table: "UserSequenceProgress",
                column: "UserId",
                principalTable: "Users",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserSequenceProgress_Sequences_SequenseId",
                table: "UserSequenceProgress");

            migrationBuilder.DropForeignKey(
                name: "FK_UserSequenceProgress_Users_UserId",
                table: "UserSequenceProgress");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Users",
                table: "Users");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Sequences",
                table: "Sequences");

            migrationBuilder.DropColumn(
                name: "Description",
                table: "SequenceGroups");

            migrationBuilder.RenameTable(
                name: "Users",
                newName: "User");

            migrationBuilder.RenameTable(
                name: "Sequences",
                newName: "Sequence");

            migrationBuilder.AddPrimaryKey(
                name: "PK_User",
                table: "User",
                column: "Id");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Sequence",
                table: "Sequence",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserSequenceProgress_Sequence_SequenseId",
                table: "UserSequenceProgress",
                column: "SequenseId",
                principalTable: "Sequence",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_UserSequenceProgress_User_UserId",
                table: "UserSequenceProgress",
                column: "UserId",
                principalTable: "User",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
