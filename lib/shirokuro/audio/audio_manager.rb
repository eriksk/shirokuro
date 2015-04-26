module SK
	class AudioManager

		attr_reader :sfx_volume, :music_volume

		def initialize context, content_root
			@sfx_volume = 1.0
			@music_volume = 1.0
			@context = context
			@content_root = content_root.end_with?("/") ? content_root : "#{content_root}/"
			@song_names = []
			@sound_names = []
			@songs = {}
			@sound_instances = []
			@sounds = {}
			@file_extension = ".ogg"
		end
		
		def register_sound name
			@sound_names << name
		end

		def register_song name
			@song_names << name
		end

		def set_music_volume volume
			@music_volume = volume
			# TODO: set on playing song instances
		end

		def set_sfx_volume volume
			@sfx_volume = volume
		end

		def load
			@song_names.each do |song|
				@songs[song] = Gosu::Song.new(@context, "#{@content_root}#{song}#{@file_extension}")
			end

			@sound_names.each do |sound|
				@sounds[sound] = Gosu::Sample.new(@context, "#{@content_root}#{sound}#{@file_extension}")
			end
		end

		def play sound_name, pitch = 1.0, looping = false
			@sound_instances << @sounds[sound_name].play(@sfx_volume, pitch, looping)
		end

		def play_pan sound_name, pan = 0, pitch = 1, looping = false
			@sound_instances << @sounds[sound_name].play(pan, @sfx_volume, pitch, looping)
		end

		def play_song song_name, looping = true
			@songs[song_name].play(looping)
		end

		def stop_song song_name
			@songs[song_name].stop
		end

		def pause_song song_name
			@songs[song_name].pause
		end

		def resume_song song_name
			if @songs[song_name].paused?
				@songs[song_name].play
			end
		end

		def get_song song_name
			@songs[song_name]
		end

		def update dt
			@sound_instances.delete_if{|s| !s.playing? }
		end
	end
end