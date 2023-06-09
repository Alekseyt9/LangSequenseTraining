

namespace LangSequenceTraining.Model
{
    internal class Sequence
    {
        public Guid Id { get; set; }

        public string Text { get; set; }

        public string Description { get; set; }

        public Guid SequenceGroupId { get; set; }

        public SequenceGroup SequenceGroup { get; set; }
    }
}
