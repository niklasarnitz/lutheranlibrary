\version "2.24.3"
% Lochner, Das Nicänische Bekenntniß. Printed page 180.
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
      \new Voice = "soprano" { \voiceOne a'2 b'4 a'4 \bar "|" d''4 d''4 cis''4 cis''4 \bar "|" b'2 a'4 a'4 \bar "|" b'4 a'4 g'4 fis'4 \bar "|" e'1 \bar "|" d'1\fermata \bar "|" }
      \new Voice = "alto" { \voiceTwo d'2 d'4 d'4 fis'4 fis'4 fis'4 fis'4 d'2 d'4 e'4 d'4 d'4 b4 d'4 d'2( cis'2) a1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t uns un -- ter Pon -- ti -- o Pi -- la -- "to," ge -- stor -- ben und be -- gra -- "ben," }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne a2 g4 fis4 b4 b4 b4 a4( a4) g4 fis4 e4 fis4 fis4 g4 a4 b2( a4 g4) fis1 }
      \new Voice = "bass" { \voiceTwo fis2 g4 d4 b,4 d4 fis4 fis,4 g,2 d4 cis4 b,4 d4 e4 d4 g,2( a,2) d1\fermata }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
