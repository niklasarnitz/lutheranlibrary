\version "2.24.3"
% Scan 190, printed p. 165: Bopelius 1682, first congregational Ehre sei dir, o HErre.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 0\mm bottom-margin = 0\mm left-margin = 3\mm right-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 <<
  \new PianoStaff <<
   \new Staff <<
    \new Voice = "soprano" { \voiceOne \clef treble \key g \major \cadenzaOn
      g'2( a'4 b'4) \bar "|" b'2 b'2 \bar "|"
      a'4( b'4 c''4) b'4 \bar "|" a'2( g'2) \bar "|." }
    \new Voice { \voiceTwo \cadenzaOn
      d'1 d'2 d'2 d'2( e'4) d'4 d'2( b2) }
   >>
  \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t Eh __ \skip 1 \skip 1 re sei dir, __ \skip 1 \skip 1 o HErr -- re. }
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t \repeat unfold 9 { \skip 1 } "(HErr.)" }
   \new Staff <<
    \new Voice { \voiceOne \clef bass \key g \major \cadenzaOn
      b2( a4 g4) \bar "|" b2 b2 \bar "|"
      fis2( g4) g4 \bar "|" fis2( g2) \bar "|." }
    \new Voice { \voiceTwo \cadenzaOn
      g,2( fis,4 g,4) g,2 g,2 d2( c4) g,4 d2( g,2) }
   >>
  >>
 >>
 \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-3 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } }
}
