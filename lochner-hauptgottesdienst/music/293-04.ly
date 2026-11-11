\version "2.24.3"
% Scan 293, printed p. 268: Dankcollecte, alternate congregational response.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 2\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}


shortBar = { \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar "," }

\score {
  <<
    \new PianoStaff <<
      \new Staff <<
        \clef treble  \cadenzaOn \omit Staff.TimeSignature
        \new Voice = "sung" { \voiceOne g'2 g'2 g'4 g'4 g'2 g'4 g'4 e'4 g'2 \shortBar a'2 g'2 g'2 e'1 \bar "|." }
        \new Voice { \voiceTwo e'2 e'2 e'4 e'4 d'2 d'4 e'4 c'4 e'2 f'2 d'2 d'2 c'1 }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        Sollt ihr des HErrn Tod "ver :" "kün :" "di :" "gen," bis daß er "kommt."
      }
      \new Staff <<
        \clef bass  \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne c'2 c'2 c'4 c'4 b2 b4 c'4 g4 c'2 c'2 c'2 b2 g1 }
        \new Voice { \voiceTwo c2 c2 c4 c4 g,2 g,4 c4 c4 c2 \shortBar f,2 g,2 g,2 c1 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
