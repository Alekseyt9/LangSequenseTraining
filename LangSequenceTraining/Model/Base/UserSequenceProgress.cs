﻿
using LangSequenceTraining.Model.Base;

namespace LangSequenceTraining.Model
{
    internal class UserSequenceProgress
    {
        public Guid Id { get; set; }

        public Guid SequenseId { get; set; }

        public Sequence Sequence { get; set; }

        public Guid UserId { get; set; }

        public User User { get; set; }

        public DateTime StartTime { get; set; }

        public DateTime? LastUpdateTime { get; set; }

        public DateTime? LastSuccessTime { get; set; }

        public ProgressStage Stage { get; set; }

    }
}
