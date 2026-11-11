\version "2.24.3"
% Scan 186, printed p. 161: Easter Alleluia, children's unison opening before the choir.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 0\mm bottom-margin = 0\mm left-margin = 0\mm right-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 <<
  \new Staff { \new Voice = "unison" { \clef treble \key d \major \time 2/2 \cadenzaOn \slurUp
    d'2 d'2 e'2( fis'2 a'1 g'2 a'2) a'1 \bar "|." } }
  \new Lyrics \lyricsto "unison" { \set ignoreMelismata = ##t Hal -- le -- lu __ \skip 1 \skip 1 \skip 1 \skip 1 ja! }
 >>
 \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-3 } \context { \Score \remove "Bar_number_engraver" }  }
}
