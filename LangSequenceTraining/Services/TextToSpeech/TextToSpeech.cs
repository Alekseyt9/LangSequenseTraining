
using Amazon;
using Amazon.Polly;
using Amazon.Polly.Model;
using Microsoft.Extensions.Configuration;

namespace LangSequenceTraining.Services
{
    internal class TextToSpeech : ITextToSpeech
    {
        private AmazonPollyClient _client;

        public TextToSpeech(IConfiguration config)
        {
            _client = new AmazonPollyClient(config["AWS_access_key"], config["AWS_secret_key"], RegionEndpoint.EUCentral1);
        }

        public async Task<Stream> SynthesizeSpeech(string text)
        {
            var synthesizeSpeechRequest = new SynthesizeSpeechRequest()
            {
                OutputFormat = OutputFormat.Mp3,
                VoiceId = VoiceId.Joanna,
                Text = text,
            };

            var response = await _client.SynthesizeSpeechAsync(synthesizeSpeechRequest);
            var audioStream = response.AudioStream;

            var outputStream = new MemoryStream();
            var buffer = new byte[2 * 1024];
            int readBytes;
            while ((readBytes = audioStream.Read(buffer, 0, 2 * 1024)) > 0)
            {
                outputStream.Write(buffer, 0, readBytes);
            }

            outputStream.Seek(0, SeekOrigin.Begin);
            return outputStream;
        }

    }
}
