\version "2.24.3"
% Scan 138, printed p. 113: Kyrie Nr. 3, final Kyrie call and response.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 4\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f page-breaking = #ly:one-page-breaking
}
\score {
  <<
    \new PianoStaff <<
      \new Staff <<
        \clef treble \cadenzaOn \omit Staff.TimeSignature
        \new Voice = "sung" {
          \voiceOne
          g'1^\markup \tiny "Chor oder Cantor." g'1
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          b'2( c''2 d''2) c''2
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          b'1( c''1)
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          d''\breve \bar "||" \break
          b'2^\markup \tiny "Gem." d''2 c''2 b'2 a'2 a'2 g'\breve \bar "||"
        }
        \new Voice {
          \voiceTwo
          d'1 e'1 g'1( f'2) e'2
          g'\breve fis'\breve \bar "||"
          g'2 a'2 g'2 g'2 e'2 fis'2 d'\breve \bar "||"
        }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "Ky :" "ri :" "e!" \skip 1 \skip 1 "E :" "lei : : : :" \skip 1 "son!"
        "HErr," er -- barm dich ü -- ber "uns!"
      }
      \new Staff <<
        \clef bass \cadenzaOn \omit Staff.TimeSignature
        \new Voice {
          \voiceOne
          b1 b1
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          g1( a2) c'2
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          d'1( g1)
          \once \override Staff.BarLine.short-bar-extent = #'(-2 . 0) \bar ","
          a\breve \bar "||"
          d'2 f'2 e'2 d'2 c'2 d'2 b\breve \bar "||"
        }
        \new Voice {
          \voiceTwo
          g1 e1 e1( d2) a2
          g1( e1) d\breve \bar "||"
          g2 d2 e2 g2 a2 d2 g\breve \bar "||"
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
