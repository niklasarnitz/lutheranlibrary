\version "2.24.3"
% Scan 137, antiphonal Kyrie No. 2. Compared with the original scan.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 4\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  <<
    \new PianoStaff <<
      \new Staff <<
        \clef treble \time 2/2 \cadenzaOn
        \new Voice = "sung" {
          \voiceOne
          f'2 g'2 a'1.\fermata \bar "|"
          a'2 bes'1 a'1\fermata \bar "||"
          a'1 a'1.\fermata \bar "|"
          g'2 g'1 a'1\fermata \bar "||"
          \break
          f'2 g'2 a'1.\fermata \bar "|"
          a'2 g'2 e'2 g'1\fermata \bar "||"
        }
        \new Voice {
          \voiceTwo
          c'2 e'2 f'1.
          f'2 f'1 f'1
          f'1 f'1.
          d'2 e'1 f'1
          \break
          c'2 e'2 f'1.
          f'2 d'2( e'2) d'1
        }
      >>
      \new Lyrics \lyricsto "sung" {
        Ky -- ri -- "e!" E -- lei -- "son!"
        Chri -- "ste!" E -- lei -- "son!"
        Ky -- ri -- "e!" E -- lei \skip 1 "son!"
      }
      \new Staff <<
        \clef bass \time 2/2 \cadenzaOn
        \new Voice {
          \voiceOne
          a2 c'2 c'1. \bar "|"
          c'2 d'1 c'1 \bar "||"
          c'1 c'1. \bar "|"
          bes2 c'1 c'1 \bar "||"
          \break
          a2 c'2 c'1. \bar "|"
          c'2 bes2( c'2) b1 \bar "||"
        }
        \new Voice {
          \voiceTwo
          f2 c2 f1._\fermata
          f2 bes,1 f1_\fermata
          f1 f1._\fermata
          g2 c1 f1_\fermata
          \break
          f2 c2 f1._\fermata
          f2 g2( c4 e4) g1_\fermata
        }
      >>
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-1 }
  }
}
