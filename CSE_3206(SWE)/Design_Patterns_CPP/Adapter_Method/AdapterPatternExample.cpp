#include <bits/stdc++.h>
#include <gtest/gtest.h>

using namespace std;

// Target Interface
class MediaPlayer {
public:
    virtual void play(const string& audioType, const string& fileName) = 0;
    virtual ~MediaPlayer() = default;
};

// Adaptee Class
class AdvancedMediaPlayer {
public:
    void playMp4(const string& fileName) {
        cout << "Playing MP4 file: " << fileName << endl;
    }

    void playVlc(const string& fileName) {
        cout << "Playing VLC file: " << fileName << endl;
    }
};

// Adapter Class
class MediaAdapter : public MediaPlayer {
private:
    unique_ptr<AdvancedMediaPlayer> advancedPlayer;

public:
    MediaAdapter(const string& audioType) {
        advancedPlayer = make_unique<AdvancedMediaPlayer>();
    }

    void play(const string& audioType, const string& fileName) override {
        if (audioType == "MP4") {
            advancedPlayer->playMp4(fileName);
        } else if (audioType == "VLC") {
            advancedPlayer->playVlc(fileName);
        }
    }
};

// Client Class
class AudioPlayer : public MediaPlayer {
private:
    unique_ptr<MediaAdapter> mediaAdapter;

public:
    void play(const string& audioType, const string& fileName) override {
        if (audioType == "MP3") {
            cout << "Playing MP3 file: " << fileName << endl;
        } else if (audioType == "MP4" || audioType == "VLC") {
            mediaAdapter = make_unique<MediaAdapter>(audioType);
            mediaAdapter->play(audioType, fileName);
        } else {
            cout << "Invalid media type: " << audioType << endl;
        }
    }
};

// Main method for testing
int main(int argc, char** argv) {
    cout << "Testing Adapter Pattern Example..." << endl;

    // Run tests
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

// Google Test Cases
TEST(AdapterPatternTest, PlayMP3) {
    AudioPlayer audioPlayer;

    testing::internal::CaptureStdout();
    audioPlayer.play("MP3", "song.mp3");
    string output = testing::internal::GetCapturedStdout();

    EXPECT_NE(output.find("Playing MP3 file: song.mp3"), string::npos);
}

TEST(AdapterPatternTest, PlayMP4) {
    AudioPlayer audioPlayer;

    testing::internal::CaptureStdout();
    audioPlayer.play("MP4", "video.mp4");
    string output = testing::internal::GetCapturedStdout();

    EXPECT_NE(output.find("Playing MP4 file: video.mp4"), string::npos);
}

TEST(AdapterPatternTest, PlayVLC) {
    AudioPlayer audioPlayer;

    testing::internal::CaptureStdout();
    audioPlayer.play("VLC", "movie.vlc");
    string output = testing::internal::GetCapturedStdout();

    EXPECT_NE(output.find("Playing VLC file: movie.vlc"), string::npos);
}

TEST(AdapterPatternTest, InvalidMediaType) {
    AudioPlayer audioPlayer;

    testing::internal::CaptureStdout();
    audioPlayer.play("AVI", "unknown.avi");
    string output = testing::internal::GetCapturedStdout();

    EXPECT_NE(output.find("Invalid media type: AVI"), string::npos);
}