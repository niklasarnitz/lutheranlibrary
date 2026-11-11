\version "2.24.3"
% Scan 138, printed p. 113: Kyrie Nr. 3, Christe call and response.
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
          g'1(^\markup \tiny "Chor oder Cantor." a'2 b'2)
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          c''2 b'2 a'1
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          \once \override NoteColumn.force-hshift = #-0.6 g'1 \bar "||" \break
          a'2^\markup \tiny "Gem." a'2 d'2 e'2 fis'2 g'\breve \bar "||"
        }
        \new Voice {
          \voiceTwo
          e'1( fis'1) g'2 g'2 fis'1
          \once \override NoteColumn.force-hshift = #0.6 g'1 \bar "||"
          c'2 d'2 b2 c'2 c'2 d'\breve \bar "||"
        }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "Chri : : : :" \skip 1 \skip 1 "ste!" "E :" "lei : : : :" "son!"
        Chri -- "ste," er -- bar -- me "dich!"
      }
      \new Staff <<
        \clef bass \cadenzaOn \omit Staff.TimeSignature
        \new Voice {
          \voiceOne
          b1( d'1)
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          e'2 d'2 d'1
          \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
          b1 \bar "||"
          g2 fis2 g2 g2 a2 b\breve \bar "||"
        }
        \new Voice {
          \voiceTwo
          e1( d1) c2 g2 d1 g1 \bar "||"
          a,2 dis2 g,2 c2 a,2 g,\breve \bar "||"
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
