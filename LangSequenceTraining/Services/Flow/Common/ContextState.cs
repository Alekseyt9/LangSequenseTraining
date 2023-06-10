

namespace LangSequenceTraining.Services
{
    internal class ContextState
    {
        public string Message { get; set; }
        public long ChannelId { get; set; }

        public Guid UserId { get; set; }
    }

}
