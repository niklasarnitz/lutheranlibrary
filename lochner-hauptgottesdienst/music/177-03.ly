\version "2.24.3"
% Scan 177, printed p. 152: Amen zu den Collecten, Nr. 3.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble  \cadenzaOn \omit Staff.TimeSignature
      \new Voice = "sung" { \voiceOne g'1 e'1 \bar "|." }
      \new Voice { \voiceTwo d'1 c'1 }
    >>
    \new Lyrics \lyricsto "sung" {
      \set ignoreMelismata = ##t A "men."
    }
    \new Staff <<
      \clef bass  \cadenzaOn \omit Staff.TimeSignature
      \new Voice { \voiceOne b1 g1 }
      \new Voice { \voiceTwo g,1 c1 }
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
