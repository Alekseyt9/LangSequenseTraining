

using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class Ex1ProcessorState : ProcessorStateBase
    {
        public Ex1ProcessorState(ExStateKind stateKind, Sequence sequence)
        {
            StateKind = stateKind;
            Sequence = sequence;
        }

        public ExStateKind StateKind { get; set; }

        public Sequence Sequence { get; set; }

    }
}
