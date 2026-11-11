\version "2.24.3"
% Scan 162, printed p. 137: Erhalte mein Herz, traditional response.
#(set-global-staff-size 16)
\header { piece = "G." tagline = ##f }
\paper {
  paper-width = 115\mm
  left-margin = 3\mm right-margin = 0\mm
  top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \cadenzaOn
      \new Voice = "choir" { \voiceOne g'4 g'2 g'4 g'4 g'2 g'4 g'4 g'4. e'8 g'2 \bar "|"
        g'4 g'4 g'4 g'4 g'2 a'2 g'1( f'1) e'1 \bar "|." }
      \new Voice { \voiceTwo c'4 c'2 c'4 c'4 c'2 c'4 c'4 c'4. c'8 c'2
        c'4 c'4 c'4 c'4 c'2 c'2 c'1.( b2) c'1 }
    >>
    \new Lyrics \lyricsto "choir" { Er -- hal -- te mein Herz bei dem Ei -- ni -- gen, daß ich dei -- nen Na -- men fürch __ te. }
    \new Staff <<
      \clef bass \cadenzaOn
      \new Voice { \voiceOne e4 e2 e4 e4 e2 e4 e4 e4. g8 e2
        e4 e4 e4 e4 e2 f2 e1( f1) g1 }
      \new Voice { \voiceTwo c4 c2 c4 c4 c2 c4 c4 c4. c8 c2
        c4 c4 c4 c4 c2 f,2 c1( d1) c1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Staff \remove "Time_signature_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
