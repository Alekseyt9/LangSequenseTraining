

namespace LangSequenceTraining.Services
{
    internal interface ITextToSpeech
    {
        Task<Stream> SynthesizeSpeech(string text);
    }
}
