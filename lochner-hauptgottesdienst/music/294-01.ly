\version "2.24.3"
% Scan 294, printed p. 269: Dankcollecte, continuation through uns allen.
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
    \new Staff {
      \new Voice = "sung" {
        \clef treble \cadenzaOn \omit Staff.TimeSignature \slurUp
        f'1 e'1 g'1 g'1 g'1 g'1 g'1 g'1 \allowBreak g'1 g'1 g'1 g'1 g'1 e'1 g'1 g'1 \allowBreak g'1
        f'1 e'\breve g'\breve \bar "|" f'1 f'1 f'1 f'1 f'1 f'1 e'1 g'1 \allowBreak g'1 \bar "|"
    g'1 g'1 g'1 g'1
        g'1 f'1 e'1 g'1 \allowBreak g'1 g'1 \shortBar g'1 g'1 g'1 e'1 g'1 g'1 g'1 g'1 \allowBreak \bar "|"
    e'1 g'1
        g'1 g'1 g'1 g'1 g'1 g'1 \allowBreak g'1 f'1 e'1( f'1) g'\breve \bar "|"
      }
    }
    \new Lyrics \lyricsto "sung" {
      \set ignoreMelismata = ##t
      des "Lei :" bes und "Blu :" tes "dei :" nes "lie :" ben "Soh :" nes "JE :" su "Chri :" sti hast
      "er :" "qui :" cket, und "bit :" ten "dei :" ne "Barm :" "her :" "zig :" keit, daß du uns "sol :"
      ches "ge :" "dei :" hen "las :" sest zu "star :" kem "Glau :" ben "ge :" gen dich und zu
      "brün :" "sti :" ger "Lie :" be "un :" ter uns "al :" \skip 1 len.
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
