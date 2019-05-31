;;; kodi-remote-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "kodi-remote" "kodi-remote.el" (23718 30856
;;;;;;  491285 595000))
;;; Generated autoloads from kodi-remote.el

(autoload 'kodi-remote-start-music-party "kodi-remote" "\
Start musik playing in kodi in party mode.

\(fn)" t nil)

(autoload 'kodi-remote-toggle-extended-info "kodi-remote" "\
Toggle extended media information.

\(fn)" t nil)

(autoload 'kodi-remote-play-pause "kodi-remote" "\
Toggle play/pause of active player.

\(fn)" t nil)

(autoload 'kodi-remote-stop "kodi-remote" "\
Stopps active player.

\(fn)" t nil)

(autoload 'kodi-remote-toggle-fullscreen "kodi-remote" "\
Toggle Fullscreen.

\(fn)" t nil)

(autoload 'kodi-remote-set-volume "kodi-remote" "\
Change volume recording to OFFSET.

\(fn OFFSET)" t nil)

(autoload 'kodi-remote-input-left "kodi-remote" "\
Move left in menu or seek small backward.

\(fn)" t nil)

(autoload 'kodi-remote-input-right "kodi-remote" "\
Move right in menu or seek small forward.

\(fn)" t nil)

(autoload 'kodi-remote-input-up "kodi-remote" "\
Move up in menu or seek big forward.

\(fn)" t nil)

(autoload 'kodi-remote-input-down "kodi-remote" "\
Move down in menu or seek big backward.

\(fn)" t nil)

(autoload 'kodi-remote-input-back "kodi-remote" "\
Move back menu.

\(fn)" t nil)

(autoload 'kodi-remote-input-delete "kodi-remote" "\
Delete selected file.

\(fn)" t nil)

(autoload 'kodi-remote-input-context-menu "kodi-remote" "\
Activate context menu.

\(fn)" t nil)

(autoload 'kodi-remote-input-home "kodi-remote" "\
Switch to the home screen.

\(fn)" t nil)

(autoload 'kodi-remote-input-enter "kodi-remote" "\
Select active item.

\(fn)" t nil)

(autoload 'kodi-remote-playlist-previous "kodi-remote" "\
Previous song in kodi music player.

\(fn)" t nil)

(autoload 'kodi-remote-playlist-next "kodi-remote" "\
Next song in kodi music player.

\(fn)" t nil)

(autoload 'kodi-remote-playlist-add-item "kodi-remote" "\
Add item to playlist.

\(fn)" t nil)

(autoload 'kodi-remote-playlist-play "kodi-remote" "\
Play current active playlist.

\(fn)" t nil)

(autoload 'kodi-remote-playlist-save "kodi-remote" "\
Save playlist as NAME.

\(fn NAME)" t nil)

(autoload 'kodi-remote-playlists-remove "kodi-remote" "\
Remove playlist.

\(fn)" t nil)

(autoload 'kodi-remote-playlists-rename "kodi-remote" "\
Rename playlist to new NAME.

\(fn NAME)" t nil)

(autoload 'kodi-remote-playlist-clear "kodi-remote" "\
Clear playlist.

\(fn)" t nil)

(autoload 'kodi-remote-playlist-remove "kodi-remote" "\
Remove item/video from playlist.

\(fn)" t nil)

(autoload 'kodi-remote-playlist-move-up "kodi-remote" "\
Move item/video up in the playlist.

\(fn)" t nil)

(autoload 'kodi-remote-playlist-move-down "kodi-remote" "\
Move item/video up in the playlist.

\(fn)" t nil)

(autoload 'kodi-remote-volume-decrease "kodi-remote" "\
Decrease the volume of kodi.

\(fn)" t nil)

(autoload 'kodi-remote-volume-increase "kodi-remote" "\
Increase the volume of kodi.

\(fn)" t nil)

(autoload 'kodi-remote-is-fullscreen "kodi-remote" "\
Update fullscreen status.

\(fn)" nil nil)

(autoload 'kodi-remote-play-url "kodi-remote" "\
Plays either direct links to video files or plugin play command URLs.

\(fn URL)" t nil)

(autoload 'kodi-remote-play-stream-url "kodi-remote" "\
Convert url to a kodi youtube plugin url and sends that to kodi.
Argument VIDEO-URL A Url from a youtube video.

\(fn VIDEO-URL)" t nil)

(autoload 'kodi-remote-append-video-url "kodi-remote" "\
Append urls from videos like youtube to kodi playlists.
Could be used for other sites, too.  whatever youtube-dl
supports.  Argument VIDEO-URL A Url from a youtube video.

\(fn VIDEO-URL)" t nil)

(autoload 'kodi-remote-play-video-url "kodi-remote" "\
Sends urls from videos like youtube to kodi.
Could be used for other sites, too.  whatever youtube-dl
supports.  Argument VIDEO-URL A Url from a youtube video.

\(fn VIDEO-URL)" t nil)

(autoload 'kodi-remote-keyboard "kodi-remote" "\
Open a `kodi-remote-keyboard-mode' buffer.

\(fn)" t nil)

(autoload 'kodi-remote-playlists-draw "kodi-remote" "\
Draw the list of playlists.
Optional argument _ARG revert excepts this param.
Optional argument _NOCONFIRM revert excepts this param.

\(fn &optional ARG NOCONFIRM)" t nil)

(autoload 'kodi-remote-draw-movies "kodi-remote" "\
Draw a list of movies.
Optional argument _ARG revert excepts this param.
Optional argument _NOCONFIRM revert excepts this param.

\(fn &optional ARG NOCONFIRM)" t nil)

(autoload 'kodi-remote-draw-shows "kodi-remote" "\
Draw a list of show entries.
Optional argument _ARG revert excepts this param.
Optional argument _NOCONFIRM revert excepts this param.

\(fn &optional ARG NOCONFIRM)" t nil)

(autoload 'kodi-remote-draw-episodes "kodi-remote" "\
Draw a list of episodes of all or a specific show.
Optional argument _ARG revert excepts this param.
Optional argument _NOCONFIRM revert excepts this param.

\(fn &optional ARG NOCONFIRM)" t nil)

(autoload 'kodi-remote-draw-music "kodi-remote" "\
Draw a list of songs of all or a specific artist.
Optional argument _ARG revert excepts this param.
Optional argument _NOCONFIRM revert excepts this param.

\(fn &optional ARG NOCONFIRM)" t nil)

(autoload 'kodi-remote-playlist-draw "kodi-remote" "\
Draw the current playlist.
Optional argument _ARG revert excepts this param.
Optional argument _NOCONFIRM revert excepts this param.

\(fn &optional ARG NOCONFIRM)" t nil)

(autoload 'kodi-remote-series-episodes "kodi-remote" "\
Open a `kodi-remote-series-episodes-mode' buffer.

\(fn)" t nil)

(autoload 'kodi-remote-songs "kodi-remote" "\
Open a `kodi-remote-songs-mode' buffer.

\(fn)" t nil)

(autoload 'kodi-remote-series "kodi-remote" "\
Open a `kodi-remote-series-mode' buffer.

\(fn)" t nil)

(autoload 'kodi-remote-music "kodi-remote" "\
Open a `kodi-remote-music-mode' buffer.

\(fn)" t nil)

(autoload 'kodi-remote "kodi-remote" "\
Open a `kodi-remote-mode' buffer.

\(fn)" t nil)

(autoload 'kodi-remote-playlist "kodi-remote" "\
Open a `kodi-remote-playlist-mode' buffer.

\(fn)" t nil)

(autoload 'kodi-remote-movies "kodi-remote" "\
Open a `kodi-remote-movies-mode' buffer.

\(fn)" t nil)

(autoload 'kodi-remote-playlists "kodi-remote" "\
Open a `kodi-remote-playlists-mode' buffer.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; kodi-remote-autoloads.el ends here
