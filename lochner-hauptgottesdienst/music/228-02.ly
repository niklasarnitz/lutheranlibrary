\version "2.24.3"
% Lochner, printed 228, Offertorium, original system 3.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper { paper-width = 100\mm top-margin = 1\mm bottom-margin = 1\mm left-margin = 3\mm right-margin = 1\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
\score {
 <<
  \new PianoStaff <<
   \new Staff <<
    \new Voice = "soprano" { \voiceOne \clef treble \key d \major \time 4/4
      d''4 b'4 a'4 b'4 \bar "|" a'2 g'2 \bar "|" fis'2 r4 fis'4 \bar "|" g'2 fis'2 \bar "|" \break e'2 r4 a'4 \bar "|" b'4 a'4 fis'2 \bar "|" e'2 d'2 \bar "|" }
    \new Voice = "alto" { \voiceTwo \time 4/4
      a'4 g'4 fis'4 g'4 fis'2 e'2 dis'2 s4 dis'4 e'2. d'4 e'2 s4 fis'4 g'4 e'4 d'2.( cis'4) d'2 }
   >>
  \new Lyrics \lyricsto "soprano" { O -- pfer der Ge -- rech -- tig -- keit, die Brand -- o -- pfer und gan -- zen "O : :" \skip 1 "pfer." }
   \new Staff <<
    \new Voice = "tenor" { \voiceOne \clef bass \key d \major \time 4/4
      fis'4 d'4 d'4 d'4 \bar "|" d'2 b2 \bar "|" b2 r4 b4 \bar "|" b2 b2 \bar "|" g2 r4 d'4 \bar "|" d'4 cis'4 a2 \bar "|" a2 fis2 \bar "|" }
    \new Voice = "bass" { \voiceTwo \time 4/4
      d4 g4 d4 g4 d2 e2 b,2 s4 b,4 e2 b,2 e2 s4 d4 g4 a4 d2 a,2 d2 }
   >>
  >>
 >>
 \layout { ragged-right = ##f \context { \Lyrics \override LyricText.font-size = #-2 } \context { \Score \remove "Bar_number_engraver" } \context { \Staff \remove "Time_signature_engraver" } }
}
