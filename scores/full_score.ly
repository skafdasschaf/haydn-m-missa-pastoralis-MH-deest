\version "2.22.0"

\include "../definitions.ly"

#(set! paper-alist (cons '("a4landscape" . (cons (* 297 mm) (* 210 mm))) paper-alist))

\paper {
	#(set-paper-size "a4landscape")
	indent = 1\cm
	#(define (page-post-process layout pages) (ly:create-toc-file layout pages))
}

#(set-global-staff-size 15.87)

\book {
	\bookpart {
		\header {
			number = "1"
			title = "K Y R I E"
		}
		\paper { indent = 3\cm }
		\tocSection "1" "Kyrie"
		\score {
			<<
				\new StaffGroup <<
					\new GrandStaff <<
						\set GrandStaff.instrumentName = "Oboe"
						\new Staff {
							\set Staff.instrumentName = "I"
							\KyrieOboeI
						}
						\new Staff {
							\set Staff.instrumentName = "II"
							\KyrieOboeII
						}
					>>
				>>
				\new StaffGroup <<
					\set StaffGroup.instrumentName = \markup \center-column { "Corno I, II" "in G" }
					\new Staff <<
						% \transpose c g,
						\partCombine \KyrieCornoI \KyrieCornoII
					>>
				>>
				\new StaffGroup <<
					\new GrandStaff <<
						\set GrandStaff.instrumentName = "Violino"
						\new Staff {
							\set Staff.instrumentName = "I"
							\KyrieViolinoI
						}
						\new Staff {
							\set Staff.instrumentName = "II"
							\KyrieViolinoII
						}
					>>
				>>
				\new ChoirStaff <<
					\new Staff {
						\set Staff.instrumentName = \SopranoIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Soprano" { \dynamicUp \KyrieSopranoNotes }
					}
					\new Lyrics \lyricsto Soprano \KyrieSopranoLyrics

					\new Staff {
						\set Staff.instrumentName = \AltoIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Alto" { \dynamicUp \KyrieAltoNotes }
					}
					\new Lyrics \lyricsto Alto \KyrieAltoLyrics

					\new Staff {
						\set Staff.instrumentName = \TenoreIncipit
						\override Staff.InstrumentName.self-alignment-Y = ##f
						\override Staff.InstrumentName.self-alignment-X = #RIGHT
						\new Voice = "Tenore" { \dynamicUp \KyrieTenoreNotes }
					}
					\new Lyrics \lyricsto Tenore \KyrieTenoreLyrics

					\new Staff {
						\set Staff.instrumentName = "Basso"
						\new Voice = "Basso" { \dynamicUp \KyrieBassoNotes }
					}
					\new Lyrics \lyricsto Basso \KyrieBassoLyrics
				>>
				\new StaffGroup <<
					\new Staff {
						\set Staff.instrumentName = \markup \center-column { "Organo" "e Bassi" }
						% \transpose c c,
						\KyrieOrgano
					}
				>>
				\new FiguredBass { \KyrieBassFigures }
			>>
			\layout { }
			\midi { \tempo 4. = 50 }
		}
	}
	\bookpart {
		\header {
			number = "2"
			title = "G L O R I A"
		}
		\tocSection "2" "Gloria"
		\score {
			<<
				\new StaffGroup <<
					\new GrandStaff <<
						\set GrandStaff.instrumentName = "ob"
						\new Staff {
							\set Staff.instrumentName = "1"
							\GloriaOboeI
						}
						\new Staff {
							\set Staff.instrumentName = "2"
							\GloriaOboeII
						}
					>>
				>>
				\new StaffGroup <<
					\set StaffGroup.instrumentName = \markup \center-column { "cor (C)" "1, 2" }
					\new Staff <<
						\partCombine \GloriaCornoI \GloriaCornoII
					>>
				>>
				\new StaffGroup <<
					\new GrandStaff <<
						\set GrandStaff.instrumentName = "vl"
						\new Staff {
							\set Staff.instrumentName = "1"
							\GloriaViolinoI
						}
						\new Staff {
							\set Staff.instrumentName = "2"
							\GloriaViolinoII
						}
					>>
				>>
				\new ChoirStaff <<
					\new Staff {
						\set Staff.instrumentName = "S"
						\new Voice = "Soprano" { \dynamicUp \GloriaSopranoNotes }
					}
					\new Lyrics \lyricsto Soprano \GloriaSopranoLyrics

					\new Staff {
						\set Staff.instrumentName = "A"
						\new Voice = "Alto" { \dynamicUp \GloriaAltoNotes }
					}
					\new Lyrics \lyricsto Alto \GloriaAltoLyrics

					\new Staff {
						\set Staff.instrumentName = "T"
						\new Voice = "Tenore" { \dynamicUp \GloriaTenoreNotes }
					}
					\new Lyrics \lyricsto Tenore \GloriaTenoreLyrics

					\new Staff {
						\set Staff.instrumentName = "B"
						\new Voice = "Basso" { \dynamicUp \GloriaBassoNotes }
					}
					\new Lyrics \lyricsto Basso \GloriaBassoLyrics
				>>
				\new StaffGroup <<
					\new Staff {
						\set Staff.instrumentName = \markup \center-column { "org" "b" }
						% \transpose c c,
						\GloriaOrgano
					}
				>>
				\new FiguredBass { \GloriaBassFigures }
			>>
			\layout { }
			\midi { \tempo 2 = 100 }
		}
	}
}
