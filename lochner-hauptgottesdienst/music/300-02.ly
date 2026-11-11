\version "2.24.3"
% Scan 300, printed p. 275: Aaronic blessing, Layriz.
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
  \new Staff {
    \clef treble \cadenzaOn \omit Staff.TimeSignature \slurUp
    e'1( g'1) g'\breve \shortBar
    e'1 g'1 g'1 \shortBar g'1 f'1 e'1 f'1 g'\breve \bar "|"
    e'1( g'1) g'\breve \shortBar g'1 e'1 g'1 \break
    g'1 g'1 g'1 g'1 e'1 g'1 g'1 \shortBar
    g'1 g'1 f'1 e'1( f'1) g'\breve \bar "|"
    e'1( g'1) g'\breve \shortBar \break
    g'1 g'1 g'1 g'1 g'1 g'1 g'1 e'1 g'1 \shortBar
    g'1 g'1 g'1 a'\breve g'\breve( f'\breve) e'\breve \bar "|."
  }
  \addlyrics {
    Der __ HErr "seg :" ne dich und "be :" "hü :" te "dich!"
    Der __ HErr "er :" "leuch :" te
    sein "An :" "ge :" sicht "ü :" ber dich und sei dir "gnä : :" __ "dig!"
    Der __ HErr
    "er :" "he :" be sein "An :" "ge :" sicht auf "dich," und "ge :" be dir
    "Frie : : :" __ "de!"
  }
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
