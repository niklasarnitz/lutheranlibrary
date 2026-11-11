\version "2.24.3"
% Lochner scan 137, concluding Kyrie of antiphonal No. 1.
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
        \clef treble \key g \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice = "sung" {
          \voiceOne
          g'1^\markup \tiny "Past. etc." a'1 b'\breve \bar "|"
          r2^\markup \tiny "Gem." b'2 b'2 a'2 \bar "|" a'1 \bar "||"
        }
        \new Voice {
          \voiceTwo
          s1 s1 s\breve s2
          g'2 g'2 fis'2 fis'1
        }
      >>
      \new Lyrics \lyricsto "sung" {
        Ky -- ri -- "e!" E -- le -- i -- "son!"
      }
      \new Staff <<
        \clef bass \key g \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice {
          \voiceOne
          s1 s1 s\breve r2 d'2 d'2 d'2 d'1
        }
        \new Voice {
          \voiceTwo
          s1 s1 s\breve s2 g2 g2 d2 d1
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
