

namespace LangSequenceTraining.Services.TextToSpeech
{
    internal interface ITextToSpeech
    {
        Task<Stream> SynthesizeSpeech(string text);
    }
}
