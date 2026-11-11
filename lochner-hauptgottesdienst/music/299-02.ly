\version "2.24.3"
% Scan 299, printed p. 274: Benedicamus, congregational response, Hommel.
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
        \clef treble \key g \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice = "sung" {
          \voiceOne
          g'2 g'2 g'2 g'2 g'2( e'2) g'1 \bar "|."
        }
        \new Voice {
          \voiceTwo
          c'2 c'2 c'2 d'2 c'1 b1
        }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        Und mit "dei :" nem "Gei : :" \skip 1 "ste."
      }
      \new Staff <<
        \clef bass \key g \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne e2 e2 e2 g2 e2( g2) d1 }
        \new Voice { \voiceTwo c2 c2 c2 b,2 c1 g,1 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
