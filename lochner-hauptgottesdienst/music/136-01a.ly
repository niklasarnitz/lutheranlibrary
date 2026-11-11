\version "2.24.3"
% Lochner scan 136, No. 1 through the Christe response.
#(set-global-staff-size 18)
\header { piece = "Nr. 1.  Mel.: Luthers deutsche Messe etc. 1526." tagline = ##f }
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
        \clef treble \key g \major \time 2/2 \cadenzaOn
        \new Voice = "sung" {
          \voiceOne
          g'1^\markup \tiny "Pastor (oder Cantor)." a'1 b'\breve\fermata \bar "|"
          r2^\markup \tiny "Gem. (mit oder ohne Orgel)."
          b'2 c''2 b'2 \bar "|" b'1 \bar "||"
          b'1^\markup \tiny "Past. etc." b'\breve \bar "|"
          r2^\markup \tiny "Gem." a'2 a'2 a'2 \bar "|" b'1\fermata \bar "||"
        }
        \new Voice {
          \voiceTwo
          s1 s1 s\breve s2
          g'2 g'2 g'2 g'1
          s1 s\breve s2
          fis'2 fis'2 fis'2 g'1
        }
      >>
      \new Lyrics \lyricsto "sung" {
        Ky -- ri -- "e!" E -- le -- i -- "son!"
        Chri -- "ste!" E -- le -- i -- "son!"
      }
      \new Staff <<
        \clef bass \key g \major \time 2/2 \cadenzaOn
        \new Voice {
          \voiceOne
          s1 s1 s\breve r2 d'2 e'2 d'2 d'1
          s1 s\breve r2 d'2 d'2 d'2 d'1
        }
        \new Voice {
          \voiceTwo
          s1 s1 s\breve s2 g2 c2 g2 g1
          s1 s\breve s2 d2 d2 d2 g1
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
