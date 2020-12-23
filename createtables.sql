create table SpotifyGenre (category varchar(25), cattype varchar(25));

insert into SpotifyGenre values ('acoustic','Genre'),('afrobeat','Genre'),('alt-rock','Genre');

create table LyricsGenius (ArtistID int, SongID int, returndata varchar(500));

insert into LyricsGenius values (502, null, null), (5566, 22, null);