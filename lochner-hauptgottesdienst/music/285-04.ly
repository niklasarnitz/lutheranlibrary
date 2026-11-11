\version "2.24.3"
% Scan 285, printed p. 260, Pax Domini.
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
        \clef treble \key f \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice = "sung" {
          \voiceOne
          g'1( a'1 \shortBar g'1 f'1) \shortBar
          g'\breve \bar "||"
          g'1( a'1 \shortBar g'1 fis'1) \shortBar g'\breve \bar "|."
        }
        \new Voice {
          \voiceTwo
          e'1( f'1 e'1 d'1) e'1 d'1
          d'1( ees'1 d'\breve) d'\breve
        }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "A : : : : : : :" \skip 1 \skip 1 \skip 1 "men."
        "A : : : : : : :" \skip 1 \skip 1 \skip 1 "men."
      }
      \new Staff <<
        \clef bass \key f \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice {
          \voiceOne
          c'\breve.( a1) c'1 b!1
          \once \omit Accidental
          bes1( c'1 bes1 a1) b!\breve
        }
        \new Voice {
          \voiceTwo
          c1( f1 \shortBar c1 d1) \shortBar c1 g,1
          g1( c1 \shortBar d\breve) \shortBar g,\breve
        }
      >>
    >>
  >>

  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
