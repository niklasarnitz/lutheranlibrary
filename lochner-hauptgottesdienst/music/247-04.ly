\version "2.24.3"
% Lochner, IV. Sanctus. Source pages 221–222.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/4 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne d''2 c''2 \bar "|" d''2 c''2\fermata \bar "|" c''2 bes'2 \bar "|" c''2 f'2 \bar "|" bes'2 a'2 \bar "|" c''2( a'2 \bar "|" g'2) f'2 \bar "|." }
      \new Voice = "alto" { \voiceTwo g'2 g'2 g'2 e'2 f'2 d'2 e'2 d'2 g'2 f'2 g'2( f'2 e'2) c'2 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t men des HEr -- "ren!" Ho -- si -- an -- na in der Hö \skip 1 \skip 1 "he!" }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne b!2 c'2 b!2 c'2 a2 bes2 g4.( a8 bes4) a4 d'2 d'2 e'4.( d'8 c'2~ c'2) a2 }
      \new Voice = "bass" { \voiceTwo g2 c2 g2 c2\fermata f2 g2 c2 d2 g,2 d2 c2( f2 c2) f,2 }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
