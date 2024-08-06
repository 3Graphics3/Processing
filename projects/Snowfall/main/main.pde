import ddf.minim.*;
import java.util.Collections;

SongPlayer songPlayer;
Snowfall snowfall;

void setup()
{
  surface.setTitle("Snowfall");

  createSongPlayer();
  createSnowfall();

  fullScreen(P2D);
}

void createSongPlayer()
{
  var minim = new Minim(this);
  songPlayer = new SongPlayer(minim);
}

void createSnowfall()
{
  var imagePath = "images/snowflakes.png";
  var generationRate = 0.72f;
  snowfall = new Snowfall(imagePath, generationRate);
}

void draw()
{
  background(0);

  songPlayer.play();

  snowfall.animate();
  snowfall.render();
}
