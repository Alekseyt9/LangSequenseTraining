
using Amazon;
using Amazon.Polly;
using Amazon.Polly.Model;
using Microsoft.Extensions.Configuration;

namespace LangSequenceTraining.Services.TextToSpeech
{
    internal class TextToSpeech
    {
        private AmazonPollyClient _client;
        private IConfiguration _config;

        public TextToSpeech(IConfiguration config)
        {
            _config = config;
            _client = new AmazonPollyClient(config["AWS_access_key"], config["AWS_secret_key"], RegionEndpoint.EUCentral1);
        }

        public async Task Init()
        {
            var outputFileName = "speech.mp3";
            var text = "I am going to school tomorrow";

            var canToken = new CancellationToken();

            var synthesizeSpeechRequest = new SynthesizeSpeechRequest()
            {
                OutputFormat = OutputFormat.Mp3,
                VoiceId = VoiceId.Joanna,
                Text = text,
            };

            var response = await _client.SynthesizeSpeechAsync(synthesizeSpeechRequest);
            var audioStream = response.AudioStream;

            using var outputStream = File.Create(@"e:\temp\1.mp3");
            var buffer = new byte[2 * 1024];
            int readBytes;
            while ((readBytes = audioStream.Read(buffer, 0, 2 * 1024)) > 0)
            {
                outputStream.Write(buffer, 0, readBytes);
            }
            outputStream.Flush();
        }


    }
}
