\version "2.24.3"
% Lochner, Der apostolische Glaube. Source pages 173–174.
% The darkened bass chord on “to” is provisionally F-sharp3 and D3.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key d \major \time 2/2 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne e'2\fermata e'2 \bar "|" a'4 a'4 a'4 a'4 \bar "|" fis'4 e'4 d'2 \bar "|" e'2( fis'2) \bar "|" g'4( fis'4 e'2) \bar "|" d'1\fermata \bar "|" }
      \new Voice = "alto" { \voiceTwo cis'2 cis'2 e'4 e'4 e'4 e'4 d'4 cis'4 b2 cis'2( d'2) d'2.( cis'4) d'1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t en, ge -- lit -- ten un -- ter Pon -- ti -- o Pi \skip 1 la \skip 1 \skip 1 "to," }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 a2 cis'4 cis'4 cis'4 cis'4 a4 a4 fis2 a1 b4( a4 a2) fis1 }
      \new Voice = "bass" { \voiceTwo a,2\fermata s2 a4 a4 a4 a,4 d4 a,4 b,2 a,2( d2) g4( d4 a,2) d1\fermata }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
