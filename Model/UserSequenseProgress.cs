

namespace GptApiTest.Entity
{
    internal class UserSequenseProgress
    {
        public Guid Id { get; set; }

        public Guid SequenseId { get; set; }

        public Sequense Sequense { get; set; }

        public DateTime AddTime { get; set; }

        public DateTime? LastUpdateTime { get; set; }

        public DateTime? LastSuccessTime { get; set; }

        public int Stage { get; set; }

    }
}
