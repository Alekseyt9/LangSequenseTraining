﻿

namespace LangSequenceTraining.Services
{
    public class ContextState
    {
        public string Message { get; set; }

        public long ChannelId { get; set; }

        public Guid UserId { get; set; }

        public ProcessorStateBase CurProcState { get; set; }

    }

}
