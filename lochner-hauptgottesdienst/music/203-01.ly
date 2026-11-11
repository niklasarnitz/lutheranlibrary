\version "2.24.3"
% Lochner, Der apostolische Glaube. Source pages 173–174.
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
      \new Voice = "soprano" { \voiceOne d'4 d'4 a'4 a'4 \bar "|" b'4 b'4 a'4 a'4 \bar "|" d''2 cis''2 \bar "|" b'2 a'2 \bar "|" b'4( a'4) g'4( fis'4) \bar "|" e'1 \bar "|" }
      \new Voice = "alto" { \voiceTwo a4 b4 e'4 d'4 d'4 d'4 d'4 d'4 fis'2 fis'2 d'2 d'2 d'2 b4( d'4) cis'1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t ei -- ni -- gen HErrn JE -- sum Chri -- "stum," ein -- ge -- bor -- nen Sohn \skip 1 Got \skip 1 "tes," }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne fis4 fis4 e4 fis4 g4 g4 fis4 fis4 b2 a2 g2 fis2 g4( fis4) g4( a4) a1 }
      \new Voice = "bass" { \voiceTwo d4 b,4 cis4 d4 g,4 b,4 d4 d4 b,2 fis2 g2 d2 g,4( d4) e4( d4) a,1 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
