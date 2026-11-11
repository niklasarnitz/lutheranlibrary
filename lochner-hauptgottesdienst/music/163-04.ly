\version "2.24.3"
% Scan 163, printed p. 138: two-member versicle and both Halleluja cadences.
#(set-global-staff-size 16)
\header { piece = "P." tagline = ##f }
\paper {
  paper-width = 115\mm
  left-margin = 3\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  \new Staff {
    \clef treble \cadenzaOn \accidentalStyle forget
    g'1 g'1 g'1 g'1 g'1 e'1 g'\breve g'\breve \bar "|"
    g'1 g'1 g'1 g'1 g'1 g'1 g'1 g'1 fis'\breve g'\breve \bar "" \break
    g'1 f'!1 e'\breve g'\breve \bar "||"
    g'1^\markup \tiny "Oder:" f'1 e'1( fis'1) g'\breve \bar "|."
  }
  \addlyrics {
    \set ignoreMelismata = ##t
    Du Hir -- te Is -- ra -- els, hö -- re,
    der du Jo -- seph hü -- test wie der Scha -- fe.
    Hal -- le -- lu -- "ja!" Hal -- le -- lu -- \skip 1 "ja!"
  }
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
