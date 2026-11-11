\version "2.24.3"
% Scan 137, Kyrie Nr. 3, first call and response; final lower treble ink-heavy.
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
        \clef treble \time 2/2 \cadenzaOn
        \new Voice = "sung" {
          \voiceOne
          g'1^\markup \tiny "Chor oder Cantor." \once \override NoteColumn.force-hshift = #-0.6 d'1
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          g'2 a'2
          b'2( a'2
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          b'1) g'1\fermata \bar "||" \break
          c''2^\markup \tiny "Gem." a'2 b'2 b'2
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          a'1\fermata \bar "||"
        }
        \new Voice {
          \voiceTwo
          d'1 \once \override NoteColumn.force-hshift = #0.6 d'1
          e'2 fis'2
          g'2( e'2 g'1) e'1 \bar "||"
          e'2 c'2 e'2 e'2 <c' e'>1 \bar "||"
        }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "Ky :" "ri :" "e!" "E :" "lei : : : :" \skip 1 \skip 1 "son!"
        "HErr," er -- bar -- me "dich!"
      }
      \new Staff <<
        \clef bass \time 2/2 \cadenzaOn
        \new Voice {
          \voiceOne
          b1. ais2
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          b2 d'2
          d'2( c'2
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          d'1) c'1 \bar "||"
          g2 \once \omit Accidental a2( a2) gis2
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          a1 \bar "||"
        }
        \new Voice {
          \voiceTwo
          g1. fis2 e2 d2
          g,2( a,2 g,1) c1_\fermata \bar "||"
          c2 \once \omit Accidental f2( e2) e2 a,1_\fermata \bar "||"
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
