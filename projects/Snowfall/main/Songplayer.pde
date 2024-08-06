class SongPlayer
{

  private Minim minim;

  private ArrayList<String> songList;
  private AudioPlayer currentSong;
  private float songDuration;

  /* Constructor definition */
  public SongPlayer(Minim minim)
  {
    this.minim = minim;

    var numberOfSongs = 4;
    this.createPlayer(numberOfSongs);
    this.currentSong = this.minim.loadFile(this.pickSong());
    this.songDuration = 0f;
  }

  /* Function definition */
  private void createPlayer(int numberOfSongs)
  {
    this.songList = new ArrayList<String>();

    for (int s = 0; s < numberOfSongs; s++)
      this.songList.add("music/carols" + (s + 1) + ".mp3");
  }

  private String pickSong()
  {
    Collections.shuffle(this.songList);
    return this.songList.get(0);
  }

  public void play()
  {
    this.currentSong.play();
    this.observeDuration();
  }

  private void observeDuration()
  {
    var deltaTime = millis() - this.songDuration;
    var carolDuration = this.currentSong.length();

    var songIsPlaying = (deltaTime < carolDuration);
    if (!songIsPlaying)
    {
      this.currentSong = this.minim.loadFile(this.pickSong());
      this.songDuration += carolDuration;
    }
  }
}
